
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Text.Method;
using Android.Widget;
using Auth0.OidcClient;
using IdentityModel.OidcClient;
using System;
using System.Text;
using Android.Runtime;
using Android.Views;



namespace CloudCakes.Droid
{
    [Activity(Label = "AndroidSample", MainLauncher = true, Icon = "@drawable/icon",
        LaunchMode = LaunchMode.SingleTask)]
    [IntentFilter(
        new[] { Intent.ActionView },
        Categories = new[] { Intent.CategoryDefault, Intent.CategoryBrowsable },
        DataScheme = "athelog.net.roloapp",
        DataHost = "athelog.auth0.com",
        DataPathPrefix = "/android/athelog.net.roloapp/callback")]

    public class MainActivity : Activity
    {
        private Auth0Client client;
        private Button loginButton;
        private TextView userDetailsTextView;
        private AuthorizeState authorizeState;
        private Misc Redirect;
        ProgressDialog progress;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            //Redirect = new Misc(bundle);//FIXME: label_1: this causes execution fail in device



            SetContentView(Resource.Layout.Main);

            //Xamarin.Forms.Forms.Init(this, bundle);//label_1
            

            loginButton = FindViewById<Button>(Resource.Id.LoginButton);
            loginButton.Click += LoginButtonOnClick;

            userDetailsTextView = FindViewById<TextView>(Resource.Id.UserDetailsTextView);
            userDetailsTextView.MovementMethod = new ScrollingMovementMethod();
            userDetailsTextView.Text = String.Empty;

            client = new Auth0Client(new Auth0ClientOptions
            {
                //Domain = Resources.GetString(Resource.Strings.auth0_domain),
                Domain = "athelog.auth0.com",
                //ClientId = Resources.GetString(Resources.String.auth0_client_id),
                ClientId = "i9urWnrS5aYbFfB5SuaGi6X0aNI1pbSA",
                Activity = this
            });

        }

        protected override void OnResume()
        {
            base.OnResume();

            if (progress != null)
            {
                progress.Dismiss();

                progress.Dispose();
                progress = null;
            }
        }

        protected override async void OnNewIntent(Intent intent)
        {
            base.OnNewIntent(intent);

            var loginResult = await client.ProcessResponseAsync(intent.DataString, authorizeState);

            var sb = new StringBuilder();
            if (loginResult.IsError)
            {
                sb.AppendLine($"An error occurred during login: {loginResult.Error}");

            }
            else
            {

                //debug info
                sb.AppendLine("Welcome user");
                //sb.AppendLine($"ID Token: {loginResult.IdentityToken}");
                //sb.AppendLine($"Access Token: {loginResult.AccessToken}");
                //sb.AppendLine($"Refresh Token: {loginResult.RefreshToken}");

                sb.AppendLine();

                sb.AppendLine("-- Claims --");
                foreach (var claim in loginResult.User.Claims)
                {
                    sb.AppendLine($"{claim.Type} = {claim.Value}");
                }

                //redirect
                RedirectToActions();

            }

            userDetailsTextView.Text =  sb.ToString();
        }

        private async void LoginButtonOnClick(object sender, EventArgs eventArgs)
        {
            userDetailsTextView.Text = "";

            progress = new ProgressDialog(this);
            progress.SetTitle("Log In v1.9");
            progress.SetMessage("Please wait modafuqaz...");
            progress.SetCancelable(false); // disable dismiss by tapping outside of the dialog
            progress.Show();

            // Prepare for the login
            authorizeState = await client.PrepareLoginAsync();

            // Send the user off to the authorization endpoint
            var uri = Android.Net.Uri.Parse(authorizeState.StartUrl);
            var intent = new Intent(Intent.ActionView, uri);
            intent.AddFlags(ActivityFlags.NoHistory);
            StartActivity(intent);
        }

        private void RedirectToActions()
        {

            StartActivity(typeof(FormsActivity));

        }
        //end of func


    }
}