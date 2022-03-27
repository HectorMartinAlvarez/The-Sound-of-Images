import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileFilter;

public class FileExplorer extends javax.swing.JDialog {

    public FileExplorer(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        
        FileFilter ff = new FileNameExtensionFilter("Imagen (*.jpg, *.png)", "jpg", "png");
        this.jFC.addChoosableFileFilter(ff);
        this.jFC.setFileFilter(ff);
    }
    
    public String getImage() {
        if(this.jFC.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) return this.jFC.getSelectedFile().getAbsolutePath();
        
        return null;
    }


    private void initComponents() {
        jFC = new javax.swing.JFileChooser();
        setTitle("Select Image...");
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jFC, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(32, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jFC, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(28, 28, 28))
        );

        pack();
    }

    private javax.swing.JFileChooser jFC;

}
