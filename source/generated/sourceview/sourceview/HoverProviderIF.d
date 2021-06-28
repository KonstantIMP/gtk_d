module sourceview.HoverProviderIF;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.ErrorG;
private import glib.GException;
private import sourceview.HoverContext;
private import sourceview.HoverDisplay;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public interface HoverProviderIF{
	/** Get the main Gtk struct */
	public GtkSourceHoverProvider* getHoverProviderStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_source_hover_provider_get_type();
	}

	/** */
	public void populateAsync(HoverContext context, HoverDisplay display, Cancellable cancellable, GAsyncReadyCallback callback, void* userData);

	/** */
	public bool populateFinish(AsyncResultIF result);
}
