module gtk.CClosureExpression;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Expression;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A variant of `GtkClosureExpression` using a C closure.
 */
public class CClosureExpression : Expression
{
	/** the main Gtk struct */
	protected GtkCClosureExpression* gtkCClosureExpression;

	/** Get the main Gtk struct */
	public GtkCClosureExpression* getCClosureExpressionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkCClosureExpression;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkCClosureExpression;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkCClosureExpression* gtkCClosureExpression, bool ownedRef = false)
	{
		this.gtkCClosureExpression = gtkCClosureExpression;
		super(cast(GtkExpression*)gtkCClosureExpression, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_cclosure_expression_get_type();
	}

	/**
	 * This function is a variant of [ctor@Gtk.ClosureExpression.new] that
	 * creates a `GClosure` by calling `g_cclosure_new()` with the given
	 * `callback_func`, `user_data` and `user_destroy`.
	 *
	 * Params:
	 *     valueType = the type of the value that this expression evaluates to
	 *     marshal = marshaller used for creating a closure
	 *     params = expressions for each parameter
	 *     callbackFunc = callback used for creating a closure
	 *     userData = user data used for creating a closure
	 *     userDestroy = destroy notify for @user_data
	 *
	 * Returns: a new `GtkExpression`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType valueType, GClosureMarshal marshal, Expression[] params, GCallback callbackFunc, void* userData, GClosureNotify userDestroy)
	{
		GtkExpression*[] paramsArray = new GtkExpression*[params.length];
		for ( int i = 0; i < params.length; i++ )
		{
			paramsArray[i] = params[i].getExpressionStruct();
		}

		auto __p = gtk_cclosure_expression_new(valueType, marshal, cast(uint)params.length, paramsArray.ptr, callbackFunc, userData, userDestroy);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkCClosureExpression*) __p);
	}
}
