/* NOTES
 * Mock page for signup 
 * 
 */

using System;
using Xamarin.Forms;

namespace CloudCakes
{
    public class SignupPage : ContentPage
    {
        public SignupPage()
        {
            // A new element we're creating here - the Entry element
            // Entry allows us to capture user input
            // We are adding a Placeholder attribute to tell the user
            // which data we want them to enter
            var email = new Entry
            {
                Placeholder = "Email"
            };

            // Similar to the email entry button, we capture the
            // users password here. To hide the password from being
            // displayed we set the `IsPassword` attribute to true
            var password = new Entry
            {
                Placeholder = "Password",
                IsPassword = true
            };

            var signupButton = new Button
            {
                Text = "Sign Up"
            };

            signupButton.Clicked += (object sender, EventArgs e) => {

            };

            Content = new StackLayout
            {
                Padding = 30,
                Spacing = 10,
                Children = {
          new Label { Text = "Signup for a CloudCakes Account", FontSize = Device.GetNamedSize (NamedSize.Large, typeof(Label)), HorizontalOptions = LayoutOptions.Center },
          email,
          password,
          signupButton
        }
            };
        }
    }
}