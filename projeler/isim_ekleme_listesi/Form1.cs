using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace isim_ekleme_listesi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        string fileName = @"C:\Logs.txt";
        private void button1_Click(object sender, EventArgs e)
        {
           
            

            string writeText = textBox1.Text;

            FileStream fs = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.Write);
            fs.Close();
            File.AppendAllText(fileName, Environment.NewLine + writeText);
            

        }
    }
}
