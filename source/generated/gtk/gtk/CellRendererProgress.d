module gtk.CellRendererProgress;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.CellRenderer;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Renders numbers as progress bars
 * 
 * `GtkCellRendererProgress` renders a numeric value as a progress par in a cell.
 * Additionally, it can display a text on top of the progress bar.
 */
public class CellRendererProgress : CellRenderer, OrientableIF
{
	/** the main Gtk struct */
	protected GtkCellRendererProgress* gtkCellRendererProgress;

	/** Get the main Gtk struct */
	public GtkCellRendererProgress* getCellRendererProgressStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCellRendererProgress;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCellRendererProgress;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCellRendererProgress* gtkCellRendererProgress, bool ownedRef = false)
	{
		this.gtkCellRendererProgress = gtkCellRendererProgress;
		super(cast(GtkCellRenderer*)gtkCellRendererProgress, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(GtkCellRendererProgress);


	/** */
	public static GType getType()
	{
		return gtk_cell_renderer_progress_get_type();
	}

	/**
	 * Creates a new `GtkCellRendererProgress`.
	 *
	 * Returns: the new cell renderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_cell_renderer_progress_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCellRendererProgress*) __p);
	}
}
