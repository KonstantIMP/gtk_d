module gtk.AppChooserT;

public  import gio.AppInfoIF;
public  import glib.Str;
public  import glib.c.functions;
public  import gobject.ObjectG;
public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkAppChooser` is an interface for widgets which allow the user to
 * choose an application.
 * 
 * The main objects that implement this interface are
 * [class@Gtk.AppChooserWidget],
 * [class@Gtk.AppChooserDialog] and [class@Gtk.AppChooserButton].
 * 
 * Applications are represented by GIO `GAppInfo` objects here.
 * GIO has a concept of recommended and fallback applications for a
 * given content type. Recommended applications are those that claim
 * to handle the content type itself, while fallback also includes
 * applications that handle a more generic content type. GIO also
 * knows the default and last-used application for a given content
 * type. The `GtkAppChooserWidget` provides detailed control over
 * whether the shown list of applications should include default,
 * recommended or fallback applications.
 * 
 * To obtain the application that has been selected in a `GtkAppChooser`,
 * use [method@Gtk.AppChooser.get_app_info].
 */
public template AppChooserT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkAppChooser* getAppChooserStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkAppChooser*)getStruct();
	}


	/**
	 * Returns the currently selected application.
	 *
	 * Returns: a `GAppInfo` for the
	 *     currently selected application
	 */
	public AppInfoIF getAppInfo()
	{
		auto __p = gtk_app_chooser_get_app_info(getAppChooserStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(AppInfoIF)(cast(GAppInfo*) __p, true);
	}

	/**
	 * Returns the content type for which the `GtkAppChooser`
	 * shows applications.
	 *
	 * Returns: the content type of @self. Free with g_free()
	 */
	public string getContentType()
	{
		auto retStr = gtk_app_chooser_get_content_type(getAppChooserStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Reloads the list of applications.
	 */
	public void refresh()
	{
		gtk_app_chooser_refresh(getAppChooserStruct());
	}
}
