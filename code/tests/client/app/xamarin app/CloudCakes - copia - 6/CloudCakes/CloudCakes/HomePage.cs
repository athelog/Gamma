/* NOTES

Mock HomePage for Login, Signup and About

*/

using System;
using Xamarin.Forms;
using Auth0.OidcClient; //for auth0 authentication

namespace CloudCakes
{
    public class HomePage : ContentPage
    {
        public HomePage()
        {


            var title = new Label
            {
                Text = "Welcome to CloudCakes guevon",
                FontSize = Device.GetNamedSize(NamedSize.Large, typeof(Label)),
                HorizontalOptions = LayoutOptions.CenterAndExpand,
            };

            var aboutButton = new Button
            {
                Text = "About Us"
            };

            var signupButton = new Button
            {
                Text = "Signup"
            };

            // Here we are implementing a click event using lambda expressions
            // when a user clicks the `aboutButton` they will navigate to the
            // About Us page.
            aboutButton.Clicked += (object sender, EventArgs e) => {
                Navigation.PushAsync(new AboutPage());
            };

            // Navigation to the Signup Page (Note: We haven't created this page yet)
            signupButton.Clicked += (object sender, EventArgs e) => {
                Navigation.PushAsync(new SignupPage());
            };

            var email = new Entry
            {
                Placeholder = "E-Mail",
            };

            var password = new Entry
            {
                Placeholder = "Password",
                IsPassword = true
            };

            var login = new Button
            {
                Text = "Login"
            };

            // With the `PushModalAsync` method we navigate the user
            // the the orders page and do not give them an option to
            // navigate back to the Homepage by clicking the back button
            login.Clicked += (sender, e) => {
                Navigation.PushModalAsync(new OrdersPage());
            };

            Content = new StackLayout
            {
                Padding = 30,
                Spacing = 10,
                Children = { title, email, password, login, signupButton, aboutButton }
            };
        }
    }
}