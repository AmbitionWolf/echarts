package cn.lk.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.lk.Dao.MapDao;
import cn.lk.VO.Map;


/**
 * Servlet implementation class PieServlet
 */
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//±‡¬Î¿‡–Õ
		response.setContentType("text/html;charset=utf-8");
		
		MapDao pd = new MapDao();
		List<Map> list = pd.getMapData();
		List<Map> list1 = pd.getMap1Data();
		List<Map> list2 = pd.getMap1Data();
		String jsonString = JSON.toJSONString(list);
		String jsonString1 = " "+JSON.toJSONString(list1);
		String jsonString2 = " "+JSON.toJSONString(list2);
		//System.err.println(jsonString);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.print(jsonString1);
		out.print(jsonString2);
		//System.out.println(list.toString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
