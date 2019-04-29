/**
 * stage 1,2
 */

import java.net.*;
import java.io.*;
public class Sample_Code_12 {

    // User and Game Server Information
    static final String NICKNAME = "서울6반_김현정_자바";
    static final String HOST = "127.0.0.1";
    static final int PORT = 1447; // Do not modify
    
    // predefined variables(Do not modify these values)
    static final int TABLE_WIDTH = 254;
    static final int TABLE_HEIGHT = 124;
    static final int NUMBER_OF_BALLS = 5;
    static final int[][] HOLES = {{0, 0}, {130, 0}, {260, 0}, {0, 130}, {130, 130}, {260, 130}};
    
    public static void main(String[] args) {
        
        Socket socket = null;
        String recv_data = null;
        byte[] bytes = new byte[1024];
        int[][] balls = new int[NUMBER_OF_BALLS][2];

        try {
            socket = new Socket();
            System.out.println("Trying Connect: " + HOST + ":" + PORT);
            socket.connect(new InetSocketAddress(HOST, PORT));
            System.out.println("Connected: " + HOST + ":" + PORT);
            
            InputStream is = socket.getInputStream();
            OutputStream os = socket.getOutputStream();

            String send_data = "9901/" + NICKNAME;
            bytes = send_data.getBytes("UTF-8");
            os.write(bytes);
            os.flush();
            System.out.println("Ready to play.");
            
            while (socket != null) {
                
                bytes = new byte[1024];
                
                int readByteCount = is.read(bytes);
                recv_data = new String(bytes, 0, readByteCount, "UTF-8");
                System.out.println("Data Received: " + recv_data);
                
                String[] split_data = recv_data.split("/");
                int idx = 0;
                try {
                    for (int i = 0; i < NUMBER_OF_BALLS; i++) {
                        for (int j = 0; j < 2; j++) {
                            balls[i][j] = Integer.parseInt(split_data[idx++]);
                        }
                    }
                }
                catch (Exception e) {
                    bytes = new byte[1024];
                    balls = new int[NUMBER_OF_BALLS][2];
                    bytes = "9902/9902".getBytes("UTF-8");
                    os.write(bytes);
                    os.flush();
                    System.out.println("Received Data has been currupted, Resend Requested.");
                    continue;
                }
                double angle = 0;
                double power = 110;
                double dx = 0;
                double dy = 0;

                if(balls[1][0]!= 0 && balls[1][1] != 0) {
                	power = 110;
                	dx = balls[1][0] - balls[0][0];
                	dy = balls[1][1] - balls[0][1];
                	
                	double 각도  = Math.atan2(dy,dx);
                	각도 = 각도 * 180 / Math.PI;
                	angle = 90-각도;
                }else if(balls[2][0] != 0 && balls[2][1] != 0) {
                	power = 120;
                	dx = balls[2][0] - balls[0][0];
                	dy = balls[2][1] - balls[0][1];
                	
                	double 각도  = Math.atan2(dy,dx);
                	각도 = 각도 * 180 / Math.PI;
                	angle = 90-각도;
                }else if(balls[3][0] != 0 && balls[3][1] != 0) {
                	power = 110;
                	dx = balls[3][0] - balls[0][0];
                	dy = balls[3][1] - balls[0][1];
                	
                	double 각도  = Math.atan2(dy,dx);
                	각도 = 각도 * 180 / Math.PI;
                	angle = 90-각도;
                }else if(balls[4][0] != 0 && balls[4][1] != 0) {
                	power = 115;
                	dx = balls[4][0] - balls[0][0];
                	dy = balls[4][1] - balls[0][1];
                	
                	double 각도  = Math.atan2(dy,dx);
                	각도 = 각도 * 180 / Math.PI;
                	angle = 90-각도;
                }
//                double length = Math.sqrt(Math.pow(dx, 2)+Math.pow(dy, 2));
//                if(length < 60) power = 80;
                ////////////////////////////////////////////////////////////////////
                // 주어진 정보(balls)를 바탕으로 샷 방향(angle)과 세기(power)를 결정하는 코드 작성 //
                //////////////////////////////////////////////////////////////////
                
                String merged_data = angle + "/" + power;
                bytes = merged_data.getBytes("UTF-8");
                os.write(bytes);
                os.flush();
                System.out.println("Data Sent: " + merged_data);
            }
            os.close();
            is.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}