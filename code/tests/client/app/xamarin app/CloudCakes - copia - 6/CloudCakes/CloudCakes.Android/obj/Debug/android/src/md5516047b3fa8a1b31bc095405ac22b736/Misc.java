package md5516047b3fa8a1b31bc095405ac22b736;


public class Misc
	extends md5b60ffeb829f638581ab2bb9b1a7f4f3f.FormsAppCompatActivity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("CloudCakes.Droid.Misc, CloudCakes.Android, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", Misc.class, __md_methods);
	}


	public Misc () throws java.lang.Throwable
	{
		super ();
		if (getClass () == Misc.class)
			mono.android.TypeManager.Activate ("CloudCakes.Droid.Misc, CloudCakes.Android, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", "", this, new java.lang.Object[] {  });
	}

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
