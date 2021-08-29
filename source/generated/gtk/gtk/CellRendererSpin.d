module gtk.CellRendererSpin;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.CellRenderer;
private import gtk.CellRendererText;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * Renders a spin button in a cell
 * 
 * `GtkCellRendererSpin` renders text in a cell like `GtkCellRendererText` from
 * which it is derived. But while `GtkCellRendererText` offers a simple entry to
 * edit the text, `GtkCellRendererSpin` offers a `GtkSpinButton` widget. Of course,
 * that means that the text has to be parseable as a floating point number.
 * 
 * The range of the spinbutton is taken from the adjustment property of the
 * cell renderer, which can be set explicitly or mapped to a column in the
 * tree model, like all properties of cell renders. `GtkCellRendererSpin`
 * also has properties for the `GtkCellRendererSpin:climb-rate` and the number
 * of `GtkCellRendererSpin:digits` to display. Other `GtkSpinButton` properties
 * can be set in a handler for the `GtkCellRenderer::editing-started` signal.
 * 
 * The `GtkCellRendererSpin` cell renderer was added in GTK 2.10.
 */
public class CellRendererSpin : CellRendererText
{
	/** the main Gtk struct */
	protected GtkCellRendererSpin* gtkCellRendererSpin;

	/** Get the main Gtk struct */
	public GtkCellRendererSpin* getCellRendererSpinStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCellRendererSpin;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCellRendererSpin;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCellRendererSpin* gtkCellRendererSpin, bool ownedRef = false)
	{
		this.gtkCellRendererSpin = gtkCellRendererSpin;
		super(cast(GtkCellRendererText*)gtkCellRendererSpin, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_cell_renderer_spin_get_type();
	}

	/**
	 * Creates a new `GtkCellRendererSpin`.
	 *
	 * Returns: a new `GtkCellRendererSpin`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_cell_renderer_spin_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCellRendererSpin*) __p);
	}
}
