package co.za.carolsBoutiqueServer.barCodeScanner;

import co.za.carolsBoutiqueServer.product.service.IServiceProduct;
import co.za.carolsBoutiqueServer.product.service.ProductRestClient;
import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamPanel;
import com.github.sarxos.webcam.WebcamResolution;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;

public class BarCodeScanner extends JFrame implements Runnable, ThreadFactory {

    private WebcamPanel panel = null;
    private Webcam webcam = null;
    private Executor executor = Executors.newSingleThreadExecutor(this);
    private boolean play;
    private String barcode;
   // private IServiceProduct service;

    public BarCodeScanner(String barcode) {
        this.barcode = barcode;
        play = true;
       // service = new ProductRestClient();
    }
    
    

    @SuppressWarnings("unchecked")

//    public static void main(String args[]) {
//        String s1 = null;
//        BarCodeScanner bs = null;
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            @Override
//            public void run() {
//                new BarCodeScanner(s1).go();
//            }
//        });
//        System.out.println(s1+"\n\n\n\n\n\n\n\n\n");
//    }
    
    public String go(){
        initWebcam();
        return barcode;
    }

    private void initWebcam() {
        Dimension size = WebcamResolution.QVGA.getSize();
        webcam = Webcam.getWebcams().get(0);
        webcam.setViewSize(size);
        panel = new WebcamPanel(webcam);
        this.add(panel);
        this.setVisible(true);
        executor.execute(this);
    }

    @Override
    public void run() {
//        do {
//            try {
//                Thread.sleep(1000);
//            } catch (InterruptedException ex) {
//                Logger.getLogger(BarCodeScanner.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            Result result = null;
//            BufferedImage image = null;
//
//            if (webcam.isOpen()) {
//                if ((image = webcam.getImage()) == null) {
//                    continue;
//                }
//            }
//            LuminanceSource source = new BufferedImageLuminanceSource(image);
//            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
//
//            try {
//                result = new MultiFormatReader().decode(bitmap);
//            } catch (NotFoundException ex) {
//                Logger.getLogger(BarCodeScanner.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//            if (result != null) {
//		String readIn = result.getText();
//                
//                    barcode = readIn;
//                
//            }
//        } while (play);
//        this.dispose();
//        System.exit(0);
    }

    @Override
    public Thread newThread(Runnable r) {
        Thread t = new Thread(r, "My Thread");
        t.setDaemon(true);
        return t;
    }


    // Variables declaration - do not modify                     
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JTextField resultField;
    // End of variables declaration                   

}
