package common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class LogAop {

	@Before("execution(* com.dht.www..*.*(..))")
	public void before(JoinPoint join) {
		
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		
		logger.info("---------- log ----------");
		
		// method name 출력
		logger.info("method ::: " + join.getSignature().getName());
		
		// 매개변수 출력
		Object[] args = join.getArgs();
		
		if(args.length > 0) {
			logger.info("---------- 매개변수 ----------");
			for (Object arg : args) {
				logger.info(arg.toString());
			}
		}
	}
	
}
