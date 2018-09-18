package cn.iankeri.hotel.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class ValidateCodeUtil {
	public static BufferedImage getCodeImage(HttpSession session)
    {
        char[] resource = new char[]{'0','1','2','3','4','5','6','7','8','9'
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q',
                'r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J',
                'K','L','M','N','O','P','Q','R','S','U','V','W','X','Y','Z'};

        Color[] color = new Color[]{Color.BLACK,Color.BLUE,Color.CYAN,Color.DARK_GRAY,Color.GRAY
                ,Color.GREEN,Color.LIGHT_GRAY,Color.YELLOW,Color.RED,Color.ORANGE,Color.PINK};

        String codeString = "";
        char[] code = new char[4];
        Random random = new Random();
        for(int i=0;i<4;i++)
        {
            char c = resource[random.nextInt(resource.length)];
            code[i] = c;
            codeString += c;
        }

        BufferedImage bimage = new BufferedImage(90, 30,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = bimage.getGraphics();

        g.setColor(Color.WHITE);
        g.fillRect(0, 0, 90, 30);

        int index = 0;

        g.setFont(new Font("微软雅黑", Font.BOLD, 24));
        for(int i=0;i<codeString.length();i++)
        {
            g.setColor(color[random.nextInt(color.length)]);

            g.drawString(code[i]+"", i*20, 20);
        }

         g.setColor(Color.LIGHT_GRAY);  
         for(int i = 0;i < code.length * 6;i++){  
             int x = random.nextInt(90);  
             int y = random.nextInt(20);  
             g.drawRect(x, y, 1, 1);  
         }  

        session.setAttribute("codeValue", codeString);//将信息写到session
        g.dispose();


        return bimage;

    }
}
