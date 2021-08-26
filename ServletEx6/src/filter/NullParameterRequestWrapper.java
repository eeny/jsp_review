package filter;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class NullParameterRequestWrapper extends HttpServletRequestWrapper {
	private Map<String, String[]> parameterMap = null;
	
	public NullParameterRequestWrapper(HttpServletRequest request) {
		super(request);
		parameterMap = new HashMap<String, String[]>(request.getParameterMap());
	}
	
	public void checkNull(String[] parameterNames) {
		for (int i = 0; i < parameterNames.length; i++) {
			if (!parameterMap.containsKey(parameterNames[i])) {
				String[] values = new String[]{""};
				parameterMap.put(parameterNames[i], values);
			}
		}
		// 넘어온 모든 name과 name의 값(value)를 parameterMap에 넣는다.
	}
	
	@Override
	public String getParameter(String name) {
		String[] values = getParameterValues(name);
		if (values != null && values.length > 0) {
			return values[0];
		} else {
			return null;			
		}
		// 넘어온 name에 값이 있다면 있는 값을 그대로 넘겨준다.
		// 넘어온 것이 하나도 없다면 null을 넘긴다.
	}
	
	@Override
	public Map<String, String[]> getParameterMap() {
		return parameterMap;
	}
	
	@Override
	public Enumeration<String> getParameterNames() {
		return Collections.enumeration(parameterMap.keySet());
	}
	
	@Override
	public String[] getParameterValues(String name) {
		return (String[])parameterMap.get(name);
	}
}
