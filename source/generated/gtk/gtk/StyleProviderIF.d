module gtk.StyleProviderIF;

private import gobject.Signals;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * `GtkStyleProvider` is an interface for style information used by
 * `GtkStyleContext`.
 * 
 * See [method@Gtk.StyleContext.add_provider] and
 * [func@Gtk.StyleContext.add_provider_for_display] for
 * adding `GtkStyleProviders`.
 * 
 * GTK uses the `GtkStyleProvider` implementation for CSS in
 * [iface@Gtk.CssProvider].
 */
public interface StyleProviderIF{
	/** Get the main Gtk struct */
	public GtkStyleProvider* getStyleProviderStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_style_provider_get_type();
	}

	/** */
	gulong addOnGtkPrivateChanged(void delegate(StyleProviderIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0);
}
