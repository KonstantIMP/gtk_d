module sourceview.Map;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Map : View
{
	/** the main Gtk struct */
	protected GtkSourceMap* gtkSourceMap;

	/** Get the main Gtk struct */
	public GtkSourceMap* getMapStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceMap;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceMap;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceMap* gtkSourceMap, bool ownedRef = false)
	{
		this.gtkSourceMap = gtkSourceMap;
		super(cast(GtkSourceView*)gtkSourceMap, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_map_get_type();
	}

	/**
	 * Creates a new #GtkSourceMap.
	 *
	 * Returns: a new #GtkSourceMap.
	 *
	 * Since: 3.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_map_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceMap*) __p);
	}

	/**
	 * Gets the #GtkSourceMap:view property, which is the view this widget is mapping.
	 *
	 * Returns: a #GtkSourceView or %NULL.
	 *
	 * Since: 3.18
	 */
	public View getView()
	{
		auto __p = gtk_source_map_get_view(gtkSourceMap);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}

	/**
	 * Sets the view that @map will be doing the mapping to.
	 *
	 * Params:
	 *     view = a #GtkSourceView
	 *
	 * Since: 3.18
	 */
	public void setView(View view)
	{
		gtk_source_map_set_view(gtkSourceMap, (view is null) ? null : view.getViewStruct());
	}
}
