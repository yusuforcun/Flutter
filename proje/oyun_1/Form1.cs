using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace oyun_1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Random rnd = new Random();
        

        
        private void button2_MouseEnter(object sender, EventArgs e)
        {
            timer1.Start();
            int sayi1 = rnd.Next(1, 100);
            int sayi2 = rnd.Next(1, 100);
            button1.Text = sayi1.ToString();
            button2.Text = sayi2.ToString();


            if (sayi1>sayi2)
            {
                button1.Width += 5;
                button1.Height += 5;
            }
            else if (sayi2>sayi1)
            {
                button2.Width += 5;
                button2.Height += 5;
            }
            else
            {
                MessageBox.Show("imleci butonlardan birinin üstüne getiriniz sayılar aynı.");
            }


            
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

            
            label2.Text = (int.Parse(label2.Text) - 1).ToString();
            if (label2.Text == "0")
            {
                timer1.Stop();
                MessageBox.Show("Süreniz bitmiştir.");
                button1.Enabled = false;
                button2.Enabled = false;
                if (button1.Width < button2.Width)
                {
                    
                }


            }
        }
    }
}
