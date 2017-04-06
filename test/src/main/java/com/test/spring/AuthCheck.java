package com.test.spring;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.test.spring.dto.AdminUniversityDTO;

@Aspect
@Component
public class AuthCheck {
    AdminUniversityDTO adto;
	HttpSession session;
   
   //주업무 메세지 지정하기 -> 포인트컷 만들기
   //회원만 접근할 할 수 있는 페이지에 대해서 작업..
   //SiteController
   //   - index()
   //   - authmember()
   //   - authanonymous()
   //   - info()
   //   - secret()
   //@Pointcut("execution(String SiteController.member*(..))")
/*   @Pointcut("execution(String *.BusStopController.universityMap(..)) "
   		+ "|| execution(String *.BusStopController.busStopCategory(..))"
   		+ "|| execution(String *.BusStopController.busStopDetailCategory(..))"
   		+ "|| execution(String *.BusStopController.busStopList(..))"
   		+ "|| execution(String *.BusStopController.busStopOK(..))"
   		+ "|| execution(String *.PolyLineController.*(..))"  )*/
	
	//일반관리자 - AdminLoginController는 제외할 것. 로그인창 자체를 접근못함.
   @Pointcut("execution(String *.BusStopController.*(..)) "
		   + "|| execution(String *.PolyLineController.*(..))"  
		   + "|| execution(String *.AdminMainController.adminMain(..))"  
		   + "|| execution(String *.AdminMainController.adminMain1(..))"
		   + "|| execution(String *.AdminBusScheduleManage.*(..))"
		   + "|| execution(String *.DeviceManageController.*(..))"
		   + "|| execution(String *.NoticeController.*(..))"
		   + "|| execution(String *.UniversityController.*(..))")
   public void member(){}
   
   @Before("member()")
   public void check(JoinPoint joinPoint){
	   
	  // adto = (AdminUniversityDTO)session.getAttribute("adto");
      //System.out.println("회원 전용 페이지입니다. 로그인 유무를 확인합니다.");
      
      //인증 티켓 유무를 확인
      //   -> 있으면 -> 그냥 통과
      //   -> 없으면 -> 시작페이지로 쫒아내기
      
      //주업무 객체의 데이터 -> 보조업무 객체 전달하기
      //1. 주업무 객체의 멤버 변수를 통해서...
      //2. 주업무 객체의 메서드의 매개변수를 통해서..(**)
      
      //joinPoint: 주업무 참조하는 프록시 객체
      Object[] args = joinPoint.getArgs();
      
      HttpServletRequest request = (HttpServletRequest)args[0];
      HttpSession session = (HttpSession)args[1];
      HttpServletResponse response = (HttpServletResponse)args[2];
      
      System.out.println(request.getRequestURI());
      
      //보조 업무
      //
      if(session == null || session.getAttribute("adto") == null){
         
         try {
            
            //인증 받지 못한 사람들..
            //response.sendRedirect("/spring/index.action");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print("<script>");
            writer.print("location.href='/spring/admin/adminLogin.action';");
            writer.print("</script>");
            writer.close();
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         
      }
      
   }
   
   
   
   
   //최고관리자
   @Pointcut("execution(String *.NoticeController.*(..)) "//공지사항
		   + "|| execution(String *.AdminBusScheduleManage.*(..))"  //버스스케쥴관리
		   + "|| execution(String *.AdminMainController.adminMain(..))"  //관리자메인
		   + "|| execution(String *.AdminMainController.adminMain1(..))"
		   + "|| execution(String *.AdminManageController.*(..))"  )
   public void root(){}
   
   @Before("root()")
   public void checkRoot(JoinPoint joinPoint){
	   
	   
	
      //joinPoint: 주업무 참조하는 프록시 객체
      Object[] args = joinPoint.getArgs();
      
      HttpServletRequest request = (HttpServletRequest)args[0];
      HttpSession session = (HttpSession)args[1];
      HttpServletResponse response = (HttpServletResponse)args[2];
      	
      AdminUniversityDTO adto = (AdminUniversityDTO) session.getAttribute("adto");
      //보조 업무 9999 아닌 얘들
      System.out.println("로그인 된 직급은 "+adto.getAdminLevel());
      if(!adto.getAdminLevel().equals("9999")){
         
         try {
            
            //인증 받지 못한 사람들..
            //response.sendRedirect("/spring/index.action");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print("<script>");
            writer.print("location.href='/spring/admin/adminLogin.action';");
            writer.print("</script>");
            writer.close();
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         
      }
      
   }

}