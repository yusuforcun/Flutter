using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace uygulama3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult cevap = MessageBox.Show("Arka plan rengini değiştirmek istiyor musunuz?", "Arka planı değiştir",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
            if (cevap==DialogResult.Yes)
            {
                Random rnd = new Random();
                int a = rnd.Next(256);
                int b = rnd.Next(256);
                int c = rnd.Next(256);
                button1.BackColor = Color.FromArgb(a, b, c);
            }
            
        }
    }
}
