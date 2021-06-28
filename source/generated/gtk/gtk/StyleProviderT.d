module gtk.StyleProviderT;

public  import gobject.Signals;
public  import gtk.c.functions;
public  import gtk.c.types;
public  import std.algorithm;


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
public template StyleProviderT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkStyleProvider* getStyleProviderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkStyleProvider*)getStruct();
	}


	/** */
	gulong addOnGtkPrivateChanged(void delegate(StyleProviderIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "gtk-private-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
