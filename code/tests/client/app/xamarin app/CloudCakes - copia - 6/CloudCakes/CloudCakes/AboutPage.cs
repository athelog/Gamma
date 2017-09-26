/* NOTES
 * Page to show up About info
 * It was created with cs format cause it's easier than XML for tutorial pur poses
 */
 


using System;
using System.Collections.Generic;
using Xamarin.Forms;

namespace CloudCakes
{
    public class AboutPage : ContentPage
    {
        public AboutPage()
        {
            var title = new Label
            {
                Text = "About Us",
                FontSize = Device.GetNamedSize(NamedSize.Large, typeof(Label)),
                HorizontalOptions = LayoutOptions.CenterAndExpand,
            };
            var description = new Label
            {
                Text = "CloudCakes aims to revolutionize the cake delivery business by delivering on-demand cakes and other treats with the click of a button. No longer will you need to go to the store or even remember your favorite type of cake - just signup for an account and you're good to go!"
            };

            var blogTitle = new Label
            {
                Text = "In The News",
                HorizontalOptions = LayoutOptions.CenterAndExpand
            };

            List<string> articles = new List<string> {
        "CloudCakes raises $50m and leads the Cake-as-a-Service models",
        "Top 10 Cities With the Best Cakes",
        "CloudCakes CEO awarded for Food Innovation Award 2016"
      };

            ListView articlesView = new ListView
            {
                ItemsSource = articles
            };

            Content = new StackLayout
            {
                Padding = 30,
                Spacing = 10,
                Children = { title, description, blogTitle, articlesView }
            };
        }
    }
}