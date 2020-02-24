package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PerfumeDAO;
import entity.Cart;
import entity.Perfume;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action ; //��ʾ���ﳵ�Ķ��� ,add,show,delete
	//��Ʒҵ���߼���Ķ���
	private PerfumeDAO idao = new PerfumeDAO(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(request.getParameter("action")!=null)
		{
			this.action = request.getParameter("action");
			if(action.equals("add")) //����������Ʒ�����ﳵ
			{
				if(addToCart(request,response))
				{
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("/failure.jsp").forward(request, response);
				}
			}
			if(action.equals("show"))//�������ʾ���ﳵ
			{
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}
			if(action.equals("delete")) //�����ִ��ɾ�����ﳵ�е���Ʒ
			{
				if(deleteFromCart(request,response))
				{
					request.getRequestDispatcher("/cart.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("/cart.jsp").forward(request, response);
				}
			}
		}
	}
	//�����Ʒ�����ﳵ�ķ���
		private boolean addToCart(HttpServletRequest request, HttpServletResponse response)
		{
			String id = request.getParameter("id");
			String number = request.getParameter("num");
			Perfume perfume = idao.getPerfumeById(Integer.parseInt(id));
			
			//�Ƿ��ǵ�һ�θ����ﳵ�����Ʒ,��Ҫ��session�д���һ���µĹ��ﳵ����
			if(request.getSession().getAttribute("cart")==null)
			{
				Cart cart = new Cart();
				request.getSession().setAttribute("cart",cart);
			}
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			if(cart.addGoodsInCart(perfume, Integer.parseInt(number)))
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
		
		//�ӹ��ﳵ��ɾ����Ʒ
		private boolean deleteFromCart(HttpServletRequest request, HttpServletResponse response)
		{
			String id = request.getParameter("id");
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			Perfume perfume = idao.getPerfumeById(Integer.parseInt(id));
		    if(cart.removeGoodsFromCart(perfume))
		    {
		    	return true;
		    }
		    else
		    {
		    	return false;
		    }
		}

}
