package md5516047b3fa8a1b31bc095405ac22b736;


public class LoginPage
	extends android.app.Activity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onNewIntent:(Landroid/content/Intent;)V:GetOnNewIntent_Landroid_content_Intent_Handler\n" +
			"";
		mono.android.Runtime.register ("CloudCakes.Droid.LoginPage, CloudCakes.Android, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", LoginPage.class, __md_methods);
	}


	public LoginPage () throws java.lang.Throwable
	{
		super ();
		if (getClass () == LoginPage.class)
			mono.android.TypeManager.Activate ("CloudCakes.Droid.LoginPage, CloudCakes.Android, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "", this, new java.lang.Object[] {  });
	}


	public void onNewIntent (android.content.Intent p0)
	{
		n_onNewIntent (p0);
	}

	private native void n_onNewIntent (android.content.Intent p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
