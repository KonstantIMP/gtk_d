module sourceview.Hover;

private import gobject.ObjectG;
private import sourceview.HoverProviderIF;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Hover : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceHover* gtkSourceHover;

	/** Get the main Gtk struct */
	public GtkSourceHover* getHoverStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceHover;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceHover;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceHover* gtkSourceHover, bool ownedRef = false)
	{
		this.gtkSourceHover = gtkSourceHover;
		super(cast(GObject*)gtkSourceHover, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_hover_get_type();
	}

	/** */
	public void addProvider(HoverProviderIF provider)
	{
		gtk_source_hover_add_provider(gtkSourceHover, (provider is null) ? null : provider.getHoverProviderStruct());
	}

	/** */
	public void removeProvider(HoverProviderIF provider)
	{
		gtk_source_hover_remove_provider(gtkSourceHover, (provider is null) ? null : provider.getHoverProviderStruct());
	}
}
