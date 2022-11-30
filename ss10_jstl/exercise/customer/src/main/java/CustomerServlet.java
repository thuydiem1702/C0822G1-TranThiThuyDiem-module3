import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Quang NN", "1995", "Quảng Trị", "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/299018878_3215053742069860_6273316575760379454_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=z0PT8GXl78kAX9DUCgd&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfAMhpIp18jc6eoCjSBoxAJwPCRyIfO_0149rkwz_ZpAJw&oe=638BBC95"));
        customerList.add(new Customer("Phi Hí", "2003", "Quảng Trị", "https://scontent.fsgn2-2.fna.fbcdn.net/v/t39.30808-6/282728387_984681938904438_5098090204039743064_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=dLYBy9gCN40AX9ViabJ&_nc_ht=scontent.fsgn2-2.fna&oh=00_AfB04uxyoH4ZwOnh9Jc6cO3V3dLuG2aQQsz1msjr4c376A&oe=638BAFC7"));
        customerList.add(new Customer("Quang Phước", "1999", "Hà Tĩnh", "https://scontent.fdad1-3.fna.fbcdn.net/v/t1.18169-9/18425071_1848153472178966_833748780243456312_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=K9e2OUJ1IoQAX-Bo4h3&_nc_ht=scontent.fdad1-3.fna&oh=00_AfAHue_uSZx82ujuzqNtsWjQBIcIHM2UDDBWz0Ogvwa7Rw&oe=63AE7EEB"));
        customerList.add(new Customer("Hoàng Duy", "2001", "Đà Nẵng", "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/315978769_1517322385409550_3985473778380024369_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=EFWiJo_BtPQAX_wa_mh&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfD40T3Ny6YMBGapmEgmDq7TAGOCP9E5MN_o4F6qA1Q9oQ&oe=638C2B22"));
        customerList.add(new Customer("Thành Nguyễn", "1997", "Quảng Nam", "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/277149337_1377594419369369_5767009593348837290_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=gM8OawljLS0AX8eMTlz&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfBOlNQ-KZ6mfB3wP4l1Sv3aWeupY0sZR1040HCChM_WaA&oe=638C53A2"));
        customerList.add(new Customer("Anh hangxom", "1998", "Quảng Nam", "https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.6435-9/143908619_121084393218789_6696964797954262088_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=19026a&_nc_ohc=n3Owho2h7lIAX8lajE-&_nc_ht=scontent.fsgn2-4.fna&oh=00_AfDI0xifMJvt-jhlMlmyuzyefgxRr3pq1zJrhtVeJ3FQsQ&oe=63AE7A3B"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
