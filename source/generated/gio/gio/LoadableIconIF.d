module gio.LoadableIconIF;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.InputStream;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;


/**
 * Extends the #GIcon interface and adds the ability to
 * load icons from streams.
 */
public interface LoadableIconIF{
	/** Get the main Gtk struct */
	public GLoadableIcon* getLoadableIconStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_loadable_icon_get_type();
	}

	/**
	 * Loads a loadable icon. For the asynchronous version of this function,
	 * see g_loadable_icon_load_async().
	 *
	 * Params:
	 *     size = an integer.
	 *     type = a location to store the type of the loaded
	 *         icon, %NULL to ignore.
	 *     cancellable = optional #GCancellable object, %NULL to
	 *         ignore.
	 *
	 * Returns: a #GInputStream to read the icon from.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream load(int size, out string type, Cancellable cancellable);

	/**
	 * Loads an icon asynchronously. To finish this function, see
	 * g_loadable_icon_load_finish(). For the synchronous, blocking
	 * version of this function, see g_loadable_icon_load().
	 *
	 * Params:
	 *     size = an integer.
	 *     cancellable = optional #GCancellable object, %NULL to ignore.
	 *     callback = a #GAsyncReadyCallback to call when the
	 *         request is satisfied
	 *     userData = the data to pass to callback function
	 */
	public void loadAsync(int size, Cancellable cancellable, GAsyncReadyCallback callback, void* userData);

	/**
	 * Finishes an asynchronous icon load started in g_loadable_icon_load_async().
	 *
	 * Params:
	 *     res = a #GAsyncResult.
	 *     type = a location to store the type of the loaded
	 *         icon, %NULL to ignore.
	 *
	 * Returns: a #GInputStream to read the icon from.
	 *
	 * Throws: GException on failure.
	 */
	public InputStream loadFinish(AsyncResultIF res, out string type);
}
