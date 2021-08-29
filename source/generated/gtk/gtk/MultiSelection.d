module gtk.MultiSelection;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.SelectionModelIF;
private import gtk.SelectionModelT;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkMultiSelection` is a `GtkSelectionModel` that allows selecting multiple
 * elements.
 */
public class MultiSelection : ObjectG, ListModelIF, SelectionModelIF
{
	/** the main Gtk struct */
	protected GtkMultiSelection* gtkMultiSelection;

	/** Get the main Gtk struct */
	public GtkMultiSelection* getMultiSelectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkMultiSelection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkMultiSelection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkMultiSelection* gtkMultiSelection, bool ownedRef = false)
	{
		this.gtkMultiSelection = gtkMultiSelection;
		super(cast(GObject*)gtkMultiSelection, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkMultiSelection);

	// add the SelectionModel capabilities
	mixin SelectionModelT!(GtkMultiSelection);


	/** */
	public static GType getType()
	{
		return gtk_multi_selection_get_type();
	}

	/**
	 * Creates a new selection to handle @model.
	 *
	 * Params:
	 *     model = the `GListModel` to manage
	 *
	 * Returns: a new `GtkMultiSelection`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListModelIF model)
	{
		auto __p = gtk_multi_selection_new((model is null) ? null : model.getListModelStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkMultiSelection*) __p, true);
	}

	/**
	 * Returns the underlying model of @self.
	 *
	 * Returns: the underlying model
	 */
	public ListModelIF getModel()
	{
		auto __p = gtk_multi_selection_get_model(gtkMultiSelection);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) __p);
	}

	/**
	 * Sets the model that @self should wrap.
	 *
	 * If @model is %NULL, @self will be empty.
	 *
	 * Params:
	 *     model = A `GListModel` to wrap
	 */
	public void setModel(ListModelIF model)
	{
		gtk_multi_selection_set_model(gtkMultiSelection, (model is null) ? null : model.getListModelStruct());
	}
}
