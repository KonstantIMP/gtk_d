module gtk.PageSetupUnixDialog;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Dialog;
private import gtk.PageSetup;
private import gtk.PrintSettings;
private import gtk.Widget;
private import gtk.Window;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkPageSetupUnixDialog` implements a page setup dialog for platforms
 * which don’t provide a native page setup dialog, like Unix.
 * 
 * ![An example GtkPageSetupUnixDialog](pagesetupdialog.png)
 * 
 * It can be used very much like any other GTK dialog, at the
 * cost of the portability offered by the high-level printing
 * API in [class@Gtk.PrintOperation].
 */
public class PageSetupUnixDialog : Dialog
{
	/** the main Gtk struct */
	protected GtkPageSetupUnixDialog* gtkPageSetupUnixDialog;

	/** Get the main Gtk struct */
	public GtkPageSetupUnixDialog* getPageSetupUnixDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkPageSetupUnixDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkPageSetupUnixDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkPageSetupUnixDialog* gtkPageSetupUnixDialog, bool ownedRef = false)
	{
		this.gtkPageSetupUnixDialog = gtkPageSetupUnixDialog;
		super(cast(GtkDialog*)gtkPageSetupUnixDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_page_setup_unix_dialog_get_type();
	}

	/**
	 * Creates a new page setup dialog.
	 *
	 * Params:
	 *     title = the title of the dialog, or %NULL
	 *     parent = transient parent of the dialog, or %NULL
	 *
	 * Returns: the new `GtkPageSetupUnixDialog`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string title, Window parent)
	{
		auto __p = gtk_page_setup_unix_dialog_new(Str.toStringz(title), (parent is null) ? null : parent.getWindowStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkPageSetupUnixDialog*) __p);
	}

	/**
	 * Gets the currently selected page setup from the dialog.
	 *
	 * Returns: the current page setup
	 */
	public PageSetup getPageSetup()
	{
		auto __p = gtk_page_setup_unix_dialog_get_page_setup(gtkPageSetupUnixDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PageSetup)(cast(GtkPageSetup*) __p);
	}

	/**
	 * Gets the current print settings from the dialog.
	 *
	 * Returns: the current print settings
	 */
	public PrintSettings getPrintSettings()
	{
		auto __p = gtk_page_setup_unix_dialog_get_print_settings(gtkPageSetupUnixDialog);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PrintSettings)(cast(GtkPrintSettings*) __p);
	}

	/**
	 * Sets the `GtkPageSetup` from which the page setup
	 * dialog takes its values.
	 *
	 * Params:
	 *     pageSetup = a `GtkPageSetup`
	 */
	public void setPageSetup(PageSetup pageSetup)
	{
		gtk_page_setup_unix_dialog_set_page_setup(gtkPageSetupUnixDialog, (pageSetup is null) ? null : pageSetup.getPageSetupStruct());
	}

	/**
	 * Sets the `GtkPrintSettings` from which the page setup dialog
	 * takes its values.
	 *
	 * Params:
	 *     printSettings = a `GtkPrintSettings`
	 */
	public void setPrintSettings(PrintSettings printSettings)
	{
		gtk_page_setup_unix_dialog_set_print_settings(gtkPageSetupUnixDialog, (printSettings is null) ? null : printSettings.getPrintSettingsStruct());
	}
}
