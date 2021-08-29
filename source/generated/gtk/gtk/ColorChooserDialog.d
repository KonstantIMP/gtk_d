module gtk.ColorChooserDialog;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.ColorChooserIF;
private import gtk.ColorChooserT;
private import gtk.Dialog;
private import gtk.Widget;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A dialog for choosing a color.
 * 
 * ![An example GtkColorChooserDialog](colorchooser.png)
 * 
 * `GtkColorChooserDialog` implements the [iface@Gtk.ColorChooser] interface
 * and does not provide much API of its own.
 * 
 * To create a `GtkColorChooserDialog`, use [ctor@Gtk.ColorChooserDialog.new].
 * 
 * To change the initially selected color, use
 * [method@Gtk.ColorChooser.set_rgba]. To get the selected color use
 * [method@Gtk.ColorChooser.get_rgba].
 */
public class ColorChooserDialog : Dialog, ColorChooserIF
{
	/** the main Gtk struct */
	protected GtkColorChooserDialog* gtkColorChooserDialog;

	/** Get the main Gtk struct */
	public GtkColorChooserDialog* getColorChooserDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkColorChooserDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkColorChooserDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkColorChooserDialog* gtkColorChooserDialog, bool ownedRef = false)
	{
		this.gtkColorChooserDialog = gtkColorChooserDialog;
		super(cast(GtkDialog*)gtkColorChooserDialog, ownedRef);
	}

	// add the ColorChooser capabilities
	mixin ColorChooserT!(GtkColorChooserDialog);


	/** */
	public static GType getType()
	{
		return gtk_color_chooser_dialog_get_type();
	}

	/**
	 * Creates a new `GtkColorChooserDialog`.
	 *
	 * Params:
	 *     title = Title of the dialog
	 *     parent = Transient parent of the dialog
	 *
	 * Returns: a new `GtkColorChooserDialog`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string title, Window parent)
	{
		auto __p = gtk_color_chooser_dialog_new(Str.toStringz(title), (parent is null) ? null : parent.getWindowStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkColorChooserDialog*) __p);
	}
}
