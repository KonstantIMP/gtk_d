module gtk.CellRendererPixbuf;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.CellRenderer;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Renders a pixbuf in a cell
 * 
 * A #GtkCellRendererPixbuf can be used to render an image in a cell. It allows
 * to render either a given #GdkPixbuf (set via the
 * #GtkCellRendererPixbuf:pixbuf property) or a named icon (set via the
 * #GtkCellRendererPixbuf:icon-name property).
 * 
 * To support the tree view, #GtkCellRendererPixbuf also supports rendering two
 * alternative pixbufs, when the #GtkCellRenderer:is-expander property is %TRUE.
 * If the #GtkCellRenderer:is-expanded property is %TRUE and the
 * #GtkCellRendererPixbuf:pixbuf-expander-open property is set to a pixbuf, it
 * renders that pixbuf, if the #GtkCellRenderer:is-expanded property is %FALSE
 * and the #GtkCellRendererPixbuf:pixbuf-expander-closed property is set to a
 * pixbuf, it renders that one.
 */
public class CellRendererPixbuf : CellRenderer
{
	/** the main Gtk struct */
	protected GtkCellRendererPixbuf* gtkCellRendererPixbuf;

	/** Get the main Gtk struct */
	public GtkCellRendererPixbuf* getCellRendererPixbufStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCellRendererPixbuf;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCellRendererPixbuf;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCellRendererPixbuf* gtkCellRendererPixbuf, bool ownedRef = false)
	{
		this.gtkCellRendererPixbuf = gtkCellRendererPixbuf;
		super(cast(GtkCellRenderer*)gtkCellRendererPixbuf, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_cell_renderer_pixbuf_get_type();
	}

	/**
	 * Creates a new #GtkCellRendererPixbuf. Adjust rendering
	 * parameters using object properties. Object properties can be set
	 * globally (with g_object_set()). Also, with #GtkTreeViewColumn, you
	 * can bind a property to a value in a #GtkTreeModel. For example, you
	 * can bind the “pixbuf” property on the cell renderer to a pixbuf value
	 * in the model, thus rendering a different image in each row of the
	 * #GtkTreeView.
	 *
	 * Returns: the new cell renderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_cell_renderer_pixbuf_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCellRendererPixbuf*) __p);
	}
}
