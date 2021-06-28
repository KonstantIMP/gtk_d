module gtk.FontButton;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.FontChooserIF;
private import gtk.FontChooserT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;
private import std.algorithm;


/**
 * The `GtkFontButton` allows to open a font chooser dialog to change
 * the font.
 * 
 * ![An example GtkFontButton](font-button.png)
 * 
 * It is suitable widget for selecting a font in a preference dialog.
 * 
 * # CSS nodes
 * 
 * ```
 * fontbutton
 * ╰── button.font
 * ╰── [content]
 * ```
 * 
 * `GtkFontButton` has a single CSS node with name fontbutton which
 * contains a button node with the .font style class.
 */
public class FontButton : Widget, FontChooserIF
{
	/** the main Gtk struct */
	protected GtkFontButton* gtkFontButton;

	/** Get the main Gtk struct */
	public GtkFontButton* getFontButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFontButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFontButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFontButton* gtkFontButton, bool ownedRef = false)
	{
		this.gtkFontButton = gtkFontButton;
		super(cast(GtkWidget*)gtkFontButton, ownedRef);
	}

	// add the FontChooser capabilities
	mixin FontChooserT!(GtkFontButton);


	/** */
	public static GType getType()
	{
		return gtk_font_button_get_type();
	}

	/**
	 * Creates a new font picker widget.
	 *
	 * Returns: a new font picker widget.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_font_button_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFontButton*) __p);
	}

	/**
	 * Creates a new font picker widget showing the given font.
	 *
	 * Params:
	 *     fontname = Name of font to display in font chooser dialog
	 *
	 * Returns: a new font picker widget.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string fontname)
	{
		auto __p = gtk_font_button_new_with_font(Str.toStringz(fontname));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_with_font");
		}

		this(cast(GtkFontButton*) __p);
	}

	/**
	 * Gets whether the dialog is modal.
	 *
	 * Returns: %TRUE if the dialog is modal
	 */
	public bool getModal()
	{
		return gtk_font_button_get_modal(gtkFontButton) != 0;
	}

	/**
	 * Retrieves the title of the font chooser dialog.
	 *
	 * Returns: an internal copy of the title string
	 *     which must not be freed.
	 */
	public string getTitle()
	{
		return Str.toString(gtk_font_button_get_title(gtkFontButton));
	}

	/**
	 * Returns whether the selected font is used in the label.
	 *
	 * Returns: whether the selected font is used in the label.
	 */
	public bool getUseFont()
	{
		return gtk_font_button_get_use_font(gtkFontButton) != 0;
	}

	/**
	 * Returns whether the selected size is used in the label.
	 *
	 * Returns: whether the selected size is used in the label.
	 */
	public bool getUseSize()
	{
		return gtk_font_button_get_use_size(gtkFontButton) != 0;
	}

	/**
	 * Sets whether the dialog should be modal.
	 *
	 * Params:
	 *     modal = %TRUE to make the dialog modal
	 */
	public void setModal(bool modal)
	{
		gtk_font_button_set_modal(gtkFontButton, modal);
	}

	/**
	 * Sets the title for the font chooser dialog.
	 *
	 * Params:
	 *     title = a string containing the font chooser dialog title
	 */
	public void setTitle(string title)
	{
		gtk_font_button_set_title(gtkFontButton, Str.toStringz(title));
	}

	/**
	 * If @use_font is %TRUE, the font name will be written
	 * using the selected font.
	 *
	 * Params:
	 *     useFont = If %TRUE, font name will be written using font chosen.
	 */
	public void setUseFont(bool useFont)
	{
		gtk_font_button_set_use_font(gtkFontButton, useFont);
	}

	/**
	 * If @use_size is %TRUE, the font name will be written using
	 * the selected size.
	 *
	 * Params:
	 *     useSize = If %TRUE, font name will be written using the
	 *         selected size.
	 */
	public void setUseSize(bool useSize)
	{
		gtk_font_button_set_use_size(gtkFontButton, useSize);
	}

	/**
	 * Emitted when the user selects a font.
	 *
	 * When handling this signal, use [method@Gtk.FontChooser.get_font]
	 * to find out which font was just selected.
	 *
	 * Note that this signal is only emitted when the user changes the font.
	 * If you need to react to programmatic font changes as well, use
	 * the notify::font signal.
	 */
	gulong addOnFontSet(void delegate(FontButton) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "font-set", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
