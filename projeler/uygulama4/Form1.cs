using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace uygulama4
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        

        

        private void kaydetToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Text Dosyası |*.txt|Tüm Dosyalar|*.*";
            DialogResult cevap = sfd.ShowDialog();
            if (cevap == DialogResult.OK)
            {
                richTextBox1.SaveFile(sfd.FileName, RichTextBoxStreamType.PlainText);
            }
        }

        private void açToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Text Dosyaları |*.txt";
            DialogResult cevap = ofd.ShowDialog();
            if (cevap == DialogResult.OK)
            {
                richTextBox1.LoadFile(ofd.FileName, RichTextBoxStreamType.PlainText);
            }
        }
    }
}
