module gtk.FontChooserDialog;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Dialog;
private import gtk.FontChooserIF;
private import gtk.FontChooserT;
private import gtk.Widget;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkFontChooserDialog` widget is a dialog for selecting a font.
 * 
 * ![An example GtkFontChooserDialog](fontchooser.png)
 * 
 * `GtkFontChooserDialog` implements the [iface@Gtk.FontChooser] interface
 * and does not provide much API of its own.
 * 
 * To create a `GtkFontChooserDialog`, use [ctor@Gtk.FontChooserDialog.new].
 * 
 * # GtkFontChooserDialog as GtkBuildable
 * 
 * The `GtkFontChooserDialog` implementation of the `GtkBuildable`
 * interface exposes the buttons with the names “select_button”
 * and “cancel_button”.
 */
public class FontChooserDialog : Dialog, FontChooserIF
{
	/** the main Gtk struct */
	protected GtkFontChooserDialog* gtkFontChooserDialog;

	/** Get the main Gtk struct */
	public GtkFontChooserDialog* getFontChooserDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFontChooserDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFontChooserDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFontChooserDialog* gtkFontChooserDialog, bool ownedRef = false)
	{
		this.gtkFontChooserDialog = gtkFontChooserDialog;
		super(cast(GtkDialog*)gtkFontChooserDialog, ownedRef);
	}

	// add the FontChooser capabilities
	mixin FontChooserT!(GtkFontChooserDialog);


	/** */
	public static GType getType()
	{
		return gtk_font_chooser_dialog_get_type();
	}

	/**
	 * Creates a new `GtkFontChooserDialog`.
	 *
	 * Params:
	 *     title = Title of the dialog
	 *     parent = Transient parent of the dialog
	 *
	 * Returns: a new `GtkFontChooserDialog`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string title, Window parent)
	{
		auto __p = gtk_font_chooser_dialog_new(Str.toStringz(title), (parent is null) ? null : parent.getWindowStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFontChooserDialog*) __p);
	}
}
