module sourceview.HoverProviderT;

public  import gio.AsyncResultIF;
public  import gio.Cancellable;
public  import glib.ErrorG;
public  import glib.GException;
public  import sourceview.HoverContext;
public  import sourceview.HoverDisplay;
public  import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public template HoverProviderT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkSourceHoverProvider* getHoverProviderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkSourceHoverProvider*)getStruct();
	}


	/** */
	public void populateAsync(HoverContext context, HoverDisplay display, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		gtk_source_hover_provider_populate_async(getHoverProviderStruct(), (context is null) ? null : context.getHoverContextStruct(), (display is null) ? null : display.getHoverDisplayStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/** */
	public bool populateFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = gtk_source_hover_provider_populate_finish(getHoverProviderStruct(), (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}
}
