using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Xamarin.Forms;
using CloudCakes.Droid;

namespace CloudCakes
{
	public partial class App : Application
	{
		public App ()
		{
			InitializeComponent();

            //MainPage = new AboutPage();//to test the About page
            //MainPage = new OrdersPage(); // to test the Orders page
            //MainPage = new SignupPage(); // to test the Signup page
            MainPage = new NavigationPage(new HomePage());//to test first login page
            //MainPage = new LoginPage();    
        }

        protected override void OnStart ()
		{
			// Handle when your app starts
		}

		protected override void OnSleep ()
		{
			// Handle when your app sleeps
		}

		protected override void OnResume ()
		{
			// Handle when your app resumes
		}
	}
}
