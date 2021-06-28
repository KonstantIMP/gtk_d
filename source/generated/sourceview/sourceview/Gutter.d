module sourceview.Gutter;

private import gobject.ObjectG;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.Widget;
private import sourceview.GutterRenderer;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Gutter : Widget
{
	/** the main Gtk struct */
	protected GtkSourceGutter* gtkSourceGutter;

	/** Get the main Gtk struct */
	public GtkSourceGutter* getGutterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceGutter;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceGutter;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceGutter* gtkSourceGutter, bool ownedRef = false)
	{
		this.gtkSourceGutter = gtkSourceGutter;
		super(cast(GtkWidget*)gtkSourceGutter, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_gutter_get_type();
	}

	/**
	 * Returns: the associated #GtkSourceView.
	 *
	 * Since: 3.24
	 */
	public View getView()
	{
		auto __p = gtk_source_gutter_get_view(gtkSourceGutter);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}

	/**
	 * Insert @renderer into the gutter. If @renderer is yet unowned then gutter
	 * claims its ownership. Otherwise just increases renderer's reference count.
	 * @renderer cannot be already inserted to another gutter.
	 *
	 * Params:
	 *     renderer = a gutter renderer (must inherit from #GtkSourceGutterRenderer).
	 *     position = the renderer position.
	 *
	 * Returns: %TRUE if operation succeeded. Otherwise %FALSE.
	 *
	 * Since: 3.0
	 */
	public bool insert(GutterRenderer renderer, int position)
	{
		return gtk_source_gutter_insert(gtkSourceGutter, (renderer is null) ? null : renderer.getGutterRendererStruct(), position) != 0;
	}

	/** */
	public void remove(GutterRenderer renderer)
	{
		gtk_source_gutter_remove(gtkSourceGutter, (renderer is null) ? null : renderer.getGutterRendererStruct());
	}

	/**
	 * Reorders @renderer in @gutter to new @position.
	 *
	 * Params:
	 *     renderer = a #GtkCellRenderer.
	 *     position = the new renderer position.
	 *
	 * Since: 2.8
	 */
	public void reorder(GutterRenderer renderer, int position)
	{
		gtk_source_gutter_reorder(gtkSourceGutter, (renderer is null) ? null : renderer.getGutterRendererStruct(), position);
	}
}
