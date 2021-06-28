module sourceview.StyleSchemeChooserWidget;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import sourceview.StyleSchemeChooserIF;
private import sourceview.StyleSchemeChooserT;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class StyleSchemeChooserWidget : Widget, StyleSchemeChooserIF
{
	/** the main Gtk struct */
	protected GtkSourceStyleSchemeChooserWidget* gtkSourceStyleSchemeChooserWidget;

	/** Get the main Gtk struct */
	public GtkSourceStyleSchemeChooserWidget* getStyleSchemeChooserWidgetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceStyleSchemeChooserWidget;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceStyleSchemeChooserWidget;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceStyleSchemeChooserWidget* gtkSourceStyleSchemeChooserWidget, bool ownedRef = false)
	{
		this.gtkSourceStyleSchemeChooserWidget = gtkSourceStyleSchemeChooserWidget;
		super(cast(GtkWidget*)gtkSourceStyleSchemeChooserWidget, ownedRef);
	}

	// add the StyleSchemeChooser capabilities
	mixin StyleSchemeChooserT!(GtkSourceStyleSchemeChooserWidget);


	/** */
	public static GType getType()
	{
		return gtk_source_style_scheme_chooser_widget_get_type();
	}

	/**
	 * Creates a new #GtkSourceStyleSchemeChooserWidget.
	 *
	 * Returns: a new  #GtkSourceStyleSchemeChooserWidget.
	 *
	 * Since: 3.16
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_style_scheme_chooser_widget_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceStyleSchemeChooserWidget*) __p);
	}
}
