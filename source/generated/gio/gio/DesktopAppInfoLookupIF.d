module gio.DesktopAppInfoLookupIF;

private import gio.AppInfoIF;
private import gio.c.functions;
public  import gio.c.types;
private import glib.Str;
private import gobject.ObjectG;


/**
 * #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
 * using the following functions.
 * 
 * Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
 * unused by GIO.
 */
public interface DesktopAppInfoLookupIF{
	/** Get the main Gtk struct */
	public GDesktopAppInfoLookup* getDesktopAppInfoLookupStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_desktop_app_info_lookup_get_type();
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
	public AppInfoIF getDefaultForUriScheme(string uriScheme);
}
