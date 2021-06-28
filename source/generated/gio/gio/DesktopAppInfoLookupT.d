module gio.DesktopAppInfoLookupT;

public  import gio.AppInfoIF;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.Str;
public  import gobject.ObjectG;


/**
 * #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
 * using the following functions.
 * 
 * Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
 * unused by GIO.
 */
public template DesktopAppInfoLookupT(TStruct)
{
	/** Get the main Gtk struct */
	public GDesktopAppInfoLookup* getDesktopAppInfoLookupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GDesktopAppInfoLookup*)getStruct();
	}


	/**
	 * Gets the default application for launching applications
	 * using this URI scheme for a particular #GDesktopAppInfoLookup
	 * implementation.
	 *
	 * The #GDesktopAppInfoLookup interface and this function is used
	 * to implement g_app_info_get_default_for_uri_scheme() backends
	 * in a GIO module. There is no reason for applications to use it
	 * directly. Applications should use g_app_info_get_default_for_uri_scheme().
	 *
	 * Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
	 * unused by GIO.
	 *
	 * Params:
	 *     uriScheme = a string containing a URI scheme.
	 *
	 * Returns: #GAppInfo for given @uri_scheme or
	 *     %NULL on error.
	 */
	public AppInfoIF getDefaultForUriScheme(string uriScheme)
	{
		auto __p = g_desktop_app_info_lookup_get_default_for_uri_scheme(getDesktopAppInfoLookupStruct(), Str.toStringz(uriScheme));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(AppInfoIF)(cast(GAppInfo*) __p, true);
	}
}
