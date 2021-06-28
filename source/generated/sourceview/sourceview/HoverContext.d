module sourceview.HoverContext;

private import gobject.ObjectG;
private import gtk.TextIter;
private import sourceview.Buffer;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class HoverContext : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceHoverContext* gtkSourceHoverContext;

	/** Get the main Gtk struct */
	public GtkSourceHoverContext* getHoverContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceHoverContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceHoverContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceHoverContext* gtkSourceHoverContext, bool ownedRef = false)
	{
		this.gtkSourceHoverContext = gtkSourceHoverContext;
		super(cast(GObject*)gtkSourceHoverContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_hover_context_get_type();
	}

	/** */
	public bool getBounds(TextIter begin, TextIter end)
	{
		return gtk_source_hover_context_get_bounds(gtkSourceHoverContext, (begin is null) ? null : begin.getTextIterStruct(), (end is null) ? null : end.getTextIterStruct()) != 0;
	}

	/**
	 * A convenience function to get the buffer.
	 *
	 * Returns: The #GtkSourceBuffer for the view
	 */
	public Buffer getBuffer()
	{
		auto __p = gtk_source_hover_context_get_buffer(gtkSourceHoverContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GtkSourceBuffer*) __p);
	}

	/** */
	public bool getIter(TextIter iter)
	{
		return gtk_source_hover_context_get_iter(gtkSourceHoverContext, (iter is null) ? null : iter.getTextIterStruct()) != 0;
	}

	/**
	 * Returns: the #GtkSourceView that owns the context
	 */
	public View getView()
	{
		auto __p = gtk_source_hover_context_get_view(gtkSourceHoverContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}
}
