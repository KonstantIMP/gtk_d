module sourceview.StyleSchemePreview;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import sourceview.StyleScheme;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class StyleSchemePreview : Widget, ActionableIF
{
	/** the main Gtk struct */
	protected GtkSourceStyleSchemePreview* gtkSourceStyleSchemePreview;

	/** Get the main Gtk struct */
	public GtkSourceStyleSchemePreview* getStyleSchemePreviewStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceStyleSchemePreview;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceStyleSchemePreview;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceStyleSchemePreview* gtkSourceStyleSchemePreview, bool ownedRef = false)
	{
		this.gtkSourceStyleSchemePreview = gtkSourceStyleSchemePreview;
		super(cast(GtkWidget*)gtkSourceStyleSchemePreview, ownedRef);
	}

	// add the Actionable capabilities
	mixin ActionableT!(GtkSourceStyleSchemePreview);


	/** */
	public static GType getType()
	{
		return gtk_source_style_scheme_preview_get_type();
	}

	/**
	 * Creates a new #GtkSourceStyleSchemePreview to preview the style scheme
	 * provided in @scheme.
	 *
	 * Params:
	 *     scheme = a #GtkSourceStyleScheme
	 *
	 * Returns: a #GtkWidget
	 *
	 * Since: 5.4
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(StyleScheme scheme)
	{
		auto __p = gtk_source_style_scheme_preview_new((scheme is null) ? null : scheme.getStyleSchemeStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceStyleSchemePreview*) __p, true);
	}

	/**
	 * Gets the #GtkSourceStyleScheme previewed by the widget.
	 *
	 * Returns: a #GtkSourceStyleScheme
	 *
	 * Since: 5.4
	 */
	public StyleScheme getScheme()
	{
		auto __p = gtk_source_style_scheme_preview_get_scheme(gtkSourceStyleSchemePreview);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(StyleScheme)(cast(GtkSourceStyleScheme*) __p);
	}

	/** */
	public bool getSelected()
	{
		return gtk_source_style_scheme_preview_get_selected(gtkSourceStyleSchemePreview) != 0;
	}

	/** */
	public void setSelected(bool selected)
	{
		gtk_source_style_scheme_preview_set_selected(gtkSourceStyleSchemePreview, selected);
	}

	/** */
	gulong addOnActivate(void delegate(StyleSchemePreview) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
