module gtk.SelectionFilterModel;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.SelectionModelIF;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkSelectionFilterModel` is a list model that presents the selection from
 * a `GtkSelectionModel`.
 */
public class SelectionFilterModel : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected GtkSelectionFilterModel* gtkSelectionFilterModel;

	/** Get the main Gtk struct */
	public GtkSelectionFilterModel* getSelectionFilterModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSelectionFilterModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSelectionFilterModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSelectionFilterModel* gtkSelectionFilterModel, bool ownedRef = false)
	{
		this.gtkSelectionFilterModel = gtkSelectionFilterModel;
		super(cast(GObject*)gtkSelectionFilterModel, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkSelectionFilterModel);


	/** */
	public static GType getType()
	{
		return gtk_selection_filter_model_get_type();
	}

	/**
	 * Creates a new `GtkSelectionFilterModel` that will include the
	 * selected items from the underlying selection model.
	 *
	 * Params:
	 *     model = the selection model to filter
	 *
	 * Returns: a new `GtkSelectionFilterModel`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SelectionModelIF model)
	{
		auto __p = gtk_selection_filter_model_new((model is null) ? null : model.getSelectionModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSelectionFilterModel*) __p, true);
	}

	/**
	 * Gets the model currently filtered or %NULL if none.
	 *
	 * Returns: The model that gets filtered
	 */
	public SelectionModelIF getModel()
	{
		auto __p = gtk_selection_filter_model_get_model(gtkSelectionFilterModel);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SelectionModelIF)(cast(GtkSelectionModel*) __p);
	}

	/**
	 * Sets the model to be filtered.
	 *
	 * Note that GTK makes no effort to ensure that @model conforms to
	 * the item type of @self. It assumes that the caller knows what they
	 * are doing and have set up an appropriate filter to ensure that item
	 * types match.
	 *
	 * Params:
	 *     model = The model to be filtered
	 */
	public void setModel(SelectionModelIF model)
	{
		gtk_selection_filter_model_set_model(gtkSelectionFilterModel, (model is null) ? null : model.getSelectionModelStruct());
	}
}
