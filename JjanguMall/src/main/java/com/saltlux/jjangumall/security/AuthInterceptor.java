package com.saltlux.jjangumall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.saltlux.jjangumall.service.UserService;


public class AuthInterceptor extends HandlerInterceptorAdapter {
   
   @Autowired
   UserService userService;

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      //1. handler 종류 확인
      if(handler instanceof HandlerMethod == false) {
         // DeafultServletHandler가 처리하는 경우(보통, assets의 정정 자원 접근)
         return true;
      }
      
      //2. casting
      HandlerMethod handlerMethod = (HandlerMethod)handler;
      
      //3. Method에 @Auth 달려 있는 지 확인
      Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

      //4. Method에 @Auth가 안달려 있으면
      if(auth == null) {
         // class에 annotation이 달려있는지 확인
         auth = handlerMethod.getBean().getClass().getAnnotation(Auth.class);
         if(auth == null) {
            return true;
         }
      }
      
      
      //6. @Auth가 달려 있는 경우에는 인증(Authetication) 여부 확인
      HttpSession session = request.getSession();

      // session이 없으면 loginform 으로
      if(session == null) {
         response.sendRedirect(request.getContextPath() + "/user/loginForm");
         return false;
      }

      // session이 있을경우 login을 뜻하는 memId에서 값을 가져온다
      String memId = (String) session.getAttribute("memId");
//      Map<String,String> map = new HashMap<String,String>();
      
//      map.put("memName", (String)session.getAttribute("memName"));
//      map.put("memId", (String)session.getAttribute("memId"));
//      map.put("memEmail", (String)session.getAttribute("memEmail"));
      
      // memId에 값이 없다면 정상적인 로그인 상태가 아니므로 로그인창으로 보내준다.
      if(memId == null) {
         response.sendRedirect(request.getContextPath() + "/user/loginForm");
         return false;         
      }
      
      // auth에 저장된 role(auth)값을 가져온다.
      String role = auth.role();
      // @Auth의 role이 admin인지 확인
      if("admin".equals(role)) {
         
         // 현제 로그인한 계정이 admin인지 확인.
         // db에서 id를 이용해서 auth 값을 가져온다.
         if(!"admin".equals(userService.getAuth(memId))){
            response.sendRedirect(request.getContextPath());
            return false;
         }
      }
      
      return true;
   }

}