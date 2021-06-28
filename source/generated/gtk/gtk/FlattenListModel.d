module gtk.FlattenListModel;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkFlattenListModel` is a list model that concatenates other list models.
 * 
 * `GtkFlattenListModel` takes a list model containing list models,
 * and flattens it into a single model.
 */
public class FlattenListModel : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected GtkFlattenListModel* gtkFlattenListModel;

	/** Get the main Gtk struct */
	public GtkFlattenListModel* getFlattenListModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFlattenListModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFlattenListModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFlattenListModel* gtkFlattenListModel, bool ownedRef = false)
	{
		this.gtkFlattenListModel = gtkFlattenListModel;
		super(cast(GObject*)gtkFlattenListModel, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkFlattenListModel);


	/** */
	public static GType getType()
	{
		return gtk_flatten_list_model_get_type();
	}

	/**
	 * Creates a new `GtkFlattenListModel` that flattens @list.
	 *
	 * Params:
	 *     model = the model to be flattened
	 *
	 * Returns: a new `GtkFlattenListModel`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListModelIF model)
	{
		auto __p = gtk_flatten_list_model_new((model is null) ? null : model.getListModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkFlattenListModel*) __p, true);
	}

	/**
	 * Gets the model set via gtk_flatten_list_model_set_model().
	 *
	 * Returns: The model flattened by @self
	 */
	public ListModelIF getModel()
	{
		auto __p = gtk_flatten_list_model_get_model(gtkFlattenListModel);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Returns the model containing the item at the given position.
	 *
	 * Params:
	 *     position = a position
	 *
	 * Returns: the model containing the item at @position
	 */
	public ListModelIF getModelForItem(uint position)
	{
		auto __p = gtk_flatten_list_model_get_model_for_item(gtkFlattenListModel, position);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Sets a new model to be flattened.
	 *
	 * Params:
	 *     model = the new model or %NULL
	 */
	public void setModel(ListModelIF model)
	{
		gtk_flatten_list_model_set_model(gtkFlattenListModel, (model is null) ? null : model.getListModelStruct());
	}
}
