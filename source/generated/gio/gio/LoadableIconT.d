module gio.LoadableIconT;

public  import gio.AsyncResultIF;
public  import gio.Cancellable;
public  import gio.InputStream;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Str;
public  import glib.c.functions;
public  import gobject.ObjectG;


/**
 * Extends the #GIcon interface and adds the ability to
 * load icons from streams.
 */
public template LoadableIconT(TStruct)
{
	/** Get the main Gtk struct */
	public GLoadableIcon* getLoadableIconStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GLoadableIcon*)getStruct();
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
	public InputStream load(int size, out string type, Cancellable cancellable)
	{
		char* outtype = null;
		GError* err = null;

		auto __p = g_loadable_icon_load(getLoadableIconStruct(), size, &outtype, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		type = Str.toString(outtype);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) __p, true);
	}

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
	public void loadAsync(int size, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_loadable_icon_load_async(getLoadableIconStruct(), size, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

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
	public InputStream loadFinish(AsyncResultIF res, out string type)
	{
		char* outtype = null;
		GError* err = null;

		auto __p = g_loadable_icon_load_finish(getLoadableIconStruct(), (res is null) ? null : res.getAsyncResultStruct(), &outtype, &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		type = Str.toString(outtype);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(InputStream)(cast(GInputStream*) __p, true);
	}
}
