module gtk.CellRendererAccel;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.CellRenderer;
private import gtk.CellRendererText;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * Renders a keyboard accelerator in a cell
 * 
 * #GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
 * combination like `Control + a`). If the cell renderer is editable,
 * the accelerator can be changed by simply typing the new combination.
 */
public class CellRendererAccel : CellRendererText
{
	/** the main Gtk struct */
	protected GtkCellRendererAccel* gtkCellRendererAccel;

	/** Get the main Gtk struct */
	public GtkCellRendererAccel* getCellRendererAccelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCellRendererAccel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCellRendererAccel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCellRendererAccel* gtkCellRendererAccel, bool ownedRef = false)
	{
		this.gtkCellRendererAccel = gtkCellRendererAccel;
		super(cast(GtkCellRendererText*)gtkCellRendererAccel, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_cell_renderer_accel_get_type();
	}

	/**
	 * Creates a new #GtkCellRendererAccel.
	 *
	 * Returns: the new cell renderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_cell_renderer_accel_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCellRendererAccel*) __p);
	}

	/**
	 * Gets emitted when the user has removed the accelerator.
	 *
	 * Params:
	 *     pathString = the path identifying the row of the edited cell
	 */
	gulong addOnAccelCleared(void delegate(string, CellRendererAccel) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "accel-cleared", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Gets emitted when the user has selected a new accelerator.
	 *
	 * Params:
	 *     pathString = the path identifying the row of the edited cell
	 *     accelKey = the new accelerator keyval
	 *     accelMods = the new acclerator modifier mask
	 *     hardwareKeycode = the keycode of the new accelerator
	 */
	gulong addOnAccelEdited(void delegate(string, uint, GdkModifierType, uint, CellRendererAccel) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "accel-edited", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
