package com.tictactoe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;
import java.util.List;

@WebServlet(name = "InitServlet", value = "/start")
public class InitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession currentSession = req.getSession();
        Field field = new Field();

        List<Sign> data = field.getFieldData();

        currentSession.setAttribute("field", field);
        currentSession.setAttribute("data", data);
        currentSession.setAttribute("signCROSS", Sign.CROSS);
        currentSession.setAttribute("signNOUGHT", Sign.NOUGHT);

        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

    }
}
