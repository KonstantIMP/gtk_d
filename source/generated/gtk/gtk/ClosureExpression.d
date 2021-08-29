module gtk.ClosureExpression;

private import glib.ConstructionException;
private import gobject.Closure;
private import gobject.ObjectG;
private import gtk.Expression;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * An expression using a custom `GClosure` to compute the value from
 * its parameters.
 */
public class ClosureExpression : Expression
{
	/** the main Gtk struct */
	protected GtkClosureExpression* gtkClosureExpression;

	/** Get the main Gtk struct */
	public GtkClosureExpression* getClosureExpressionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkClosureExpression;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkClosureExpression;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkClosureExpression* gtkClosureExpression, bool ownedRef = false)
	{
		this.gtkClosureExpression = gtkClosureExpression;
		super(cast(GtkExpression*)gtkClosureExpression, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_closure_expression_get_type();
	}

	/**
	 * Creates a `GtkExpression` that calls `closure` when it is evaluated.
	 *
	 * `closure` is called with the `this` object and the results of evaluating
	 * the `params` expressions.
	 *
	 * Params:
	 *     valueType = the type of the value that this expression evaluates to
	 *     closure = closure to call when evaluating this expression. If closure is floating, it is adopted
	 *     params = expressions for each parameter
	 *
	 * Returns: a new `GtkExpression`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType valueType, Closure closure, Expression[] params)
	{
		GtkExpression*[] paramsArray = new GtkExpression*[params.length];
		for ( int i = 0; i < params.length; i++ )
		{
			paramsArray[i] = params[i].getExpressionStruct();
		}

		auto __p = gtk_closure_expression_new(valueType, (closure is null) ? null : closure.getClosureStruct(), cast(uint)params.length, paramsArray.ptr);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkClosureExpression*) __p);
	}
}
