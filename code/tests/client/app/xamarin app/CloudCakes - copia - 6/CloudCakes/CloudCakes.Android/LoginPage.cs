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


namespace CloudCakes.Droid
{
    //[Activity(Label = "AndroidSample", MainLauncher = true, Icon = "@drawable/icon",
      //  LaunchMode = LaunchMode.SingleTask)]
    [IntentFilter(
        new[] { Intent.ActionView },
        Categories = new[] { Intent.CategoryDefault, Intent.CategoryBrowsable },
        DataScheme = "athelog.net.roloapp",
        DataHost = "athelog.auth0.com",
        DataPathPrefix = "/android/athelog.net.roloapp/callback")]
    public class LoginPage : Activity
    {
        private Auth0Client client;
        private Button loginButton;
        private TextView userDetailsTextView;
        private AuthorizeState authorizeState;
        ProgressDialog progress;

        //protected override void OnCreate(Bundle bundle)//FIXME: former vesion
        protected void LoginStart()

        {
            //base.OnCreate(bundle);//FIXME: former vesion
            //SetContentView(Resource.Layout.Main);//FIXME: former vesion

            //loginButton = FindViewById<Button>(Resource.Id.LoginButton);//FIXME: dont know if this is required
            loginButton.Click += LoginButtonOnClick;

            //userDetailsTextView = FindViewById<TextView>(Resource.Id.UserDetailsTextView);//FIXME: dont know if this is required
            userDetailsTextView.MovementMethod = new ScrollingMovementMethod();
            userDetailsTextView.Text = String.Empty;

            client = new Auth0Client(new Auth0ClientOptions
            {
                //Domain = Resources.GetString(Resource.String.auth0_domain),//FIXME: not needed anymore
                Domain = "athelog.auth0.com",
                //ClientId = Resources.GetString(Resource.String.auth0_client_id),//FIXME: this didnt work in original test that worked
                ClientId = "i9urWnrS5aYbFfB5SuaGi6X0aNI1pbSA",
                Activity = this
            });
        }

        /*
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
        */

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
                //printing results of user data
                sb.AppendLine($"ID Token: {loginResult.IdentityToken}");
                sb.AppendLine($"Access Token: {loginResult.AccessToken}");
                sb.AppendLine($"Refresh Token: {loginResult.RefreshToken}");

                sb.AppendLine();

                sb.AppendLine("-- Claims --");
                foreach (var claim in loginResult.User.Claims)
                {
                    sb.AppendLine($"{claim.Type} = {claim.Value}");
                }
            }

            userDetailsTextView.Text = sb.ToString();
        }

        private async void LoginButtonOnClick(object sender, EventArgs eventArgs)
        {
            userDetailsTextView.Text = "";

            progress = new ProgressDialog(this);
            progress.SetTitle("Log In v1.3");
            progress.SetMessage("Please wait modafuqa...");
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
    }
}


    