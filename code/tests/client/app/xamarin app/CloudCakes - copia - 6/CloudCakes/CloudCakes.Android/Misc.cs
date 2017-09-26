using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace CloudCakes.Droid
{
    class Misc: global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {

        public Misc(Bundle bundle)
        {

            global::Xamarin.Forms.Forms.Init(this, bundle); //this line works
           


        }
        //end of func

        public void Redirect()
        {
            LoadApplication(new CloudCakes.App());//this requires global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity in the class inheritance
        }


    }
}