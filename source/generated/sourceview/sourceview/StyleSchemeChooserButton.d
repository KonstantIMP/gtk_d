module sourceview.StyleSchemeChooserButton;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Button;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import sourceview.StyleSchemeChooserIF;
private import sourceview.StyleSchemeChooserT;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class StyleSchemeChooserButton : Button, StyleSchemeChooserIF
{
	/** the main Gtk struct */
	protected GtkSourceStyleSchemeChooserButton* gtkSourceStyleSchemeChooserButton;

	/** Get the main Gtk struct */
	public GtkSourceStyleSchemeChooserButton* getStyleSchemeChooserButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceStyleSchemeChooserButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceStyleSchemeChooserButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceStyleSchemeChooserButton* gtkSourceStyleSchemeChooserButton, bool ownedRef = false)
	{
		this.gtkSourceStyleSchemeChooserButton = gtkSourceStyleSchemeChooserButton;
		super(cast(GtkButton*)gtkSourceStyleSchemeChooserButton, ownedRef);
	}

	// add the StyleSchemeChooser capabilities
	mixin StyleSchemeChooserT!(GtkSourceStyleSchemeChooserButton);


	/** */
	public static GType getType()
	{
		return gtk_source_style_scheme_chooser_button_get_type();
	}

	/**
	 * Creates a new #GtkSourceStyleSchemeChooserButton.
	 *
	 * Returns: a new #GtkSourceStyleSchemeChooserButton.
	 *
	 * Since: 3.16
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_style_scheme_chooser_button_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceStyleSchemeChooserButton*) __p);
	}
}
