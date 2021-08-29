module gtk.AppChooserIF;

private import gio.AppInfoIF;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.c.functions;
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
public interface AppChooserIF{
	/** Get the main Gtk struct */
	public GtkAppChooser* getAppChooserStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_app_chooser_get_type();
	}

	/**
	 * Returns the currently selected application.
	 *
	 * Returns: a `GAppInfo` for the
	 *     currently selected application
	 */
	public AppInfoIF getAppInfo();

	/**
	 * Returns the content type for which the `GtkAppChooser`
	 * shows applications.
	 *
	 * Returns: the content type of @self. Free with g_free()
	 */
	public string getContentType();

	/**
	 * Reloads the list of applications.
	 */
	public void refresh();
}
